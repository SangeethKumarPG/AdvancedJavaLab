package com.sangeeth.mvoc;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.PriorityQueue;

public class QueueOperations {

	private PriorityQueue<Movie> movies = new PriorityQueue<>(new MovieComparator());
	
	public void addItem(Movie movie) {
		this.movies.add(movie);
	}
	
	public void showMovieDetails(Movie currentMovie) {
		System.out.println("=======================================");
		System.out.println("Id : "+currentMovie.getId());
		System.out.println("Name : "+currentMovie.getName());
		System.out.println("Director : "+currentMovie.getDirector());
		System.out.println("Genre : "+currentMovie.getGenre());
		System.out.println("Rating : "+currentMovie.getRating());
		System.out.println("Budget :$ "+currentMovie.getBudget());
		System.out.println("Revenue :$ "+currentMovie.getRevenue());
		System.out.println("=======================================");
	}
	
	public void getAllMovies(){
		Iterator<Movie> movieIterator= this.movies.iterator();
		while(movieIterator.hasNext()) {
			Movie currentMovie = movieIterator.next();
			showMovieDetails(currentMovie);
		}
	}
	
	public boolean deleteMovie(long id) {
		boolean deleted = false;
		if(!this.movies.isEmpty()) {
			Iterator<Movie> movieIterator = this.movies.iterator();
			while(movieIterator.hasNext()) {
				Movie currentMovie = movieIterator.next();
				if(currentMovie.getId() == id) {
					movieIterator.remove();
					deleted = true;
				}
			}
		}
		return deleted;
	}
	
	public Movie getMovieById(long id) {
		Movie movie = null;
		Iterator<Movie> movieIterator = this.movies.iterator();
		while(movieIterator.hasNext()) {
			Movie currentMovie = movieIterator.next();
			if(currentMovie.getId() == id) {
				movie = currentMovie;
				break;
			}
		}
		return movie;
	}
	
	public boolean updateMovie(long id, Movie movie) {
		boolean isUpdated = false;
		Iterator<Movie> movieIterator = this.movies.iterator();
		Movie currentMovie = null;
		while(movieIterator.hasNext()) {
			currentMovie = movieIterator.next();
			if(currentMovie.getId() == id) {
				currentMovie.setName(movie.getName());
				currentMovie.setBudget(movie.getBudget());
				currentMovie.setDirector(movie.getDirector());
				currentMovie.setGenre(movie.getGenre());
				currentMovie.setRating(movie.getRating());
				currentMovie.setRevenue(movie.getRevenue());
				isUpdated = true;
			}
		}
		
		return isUpdated;
	}
	
	public PriorityQueue<Movie> getMovieQue(){
		return this.movies;
	}
	public void getSortedMovies(){
		List<Movie> movieList = new ArrayList<>(this.movies);
		Collections.sort(movieList, new MovieComparator());
		Iterator<Movie> movieIterator = movieList.iterator();
		while(movieIterator.hasNext()) {
			showMovieDetails(movieIterator.next());
		}
	}
	
}
